#!/bin/bash

tags=(europe-2006 arguments technical meta new-zealand-christmas personal projects)

for tag in "${tags[@]}" ; do
    pup '.title text{}' < old/$tag.html > /tmp/$tag.tags
done

for year_path in old/2* ; do
    year=`basename $year_path`
    for month_path in $year_path/* ; do
        month=`basename $month_path`
        for day_path in $month_path/* ; do
            day=`basename $day_path`
            for post_path in $day_path/* ; do
                post=`basename $post_path`
                title=$(pup 'h2.title text{}' < $post_path)
                date=$(pup '.article > .meta text{}' < $post_path | date --date="`sed -e 's/@//' -e 's/.* on //' -e 's/[a-z]*,/,/'`" --rfc-3339=seconds)
                body=$(pup '.article > .body' < $post_path)
                comments=$(pup '.comments' < $post_path)

                mytags=""
                for tag in "${tags[@]}" ; do
                    if grep "$title" /tmp/$tag.tags > /dev/null ; then
                        mytags="$mytags $tag"
                    fi
                done

                echo $title $mytags
                cat <<EOF > _posts/$year-$month-$day-$post
---
layout: post
title: $title
date: $date
category:$mytags
---
$body
EOF
            done
        done
    done
done

