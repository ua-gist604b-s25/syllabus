for REC in $(cat reference_repos.txt); do
    OLD_NAME=$(echo $REC| cut -f1 -d:)
    REFERENCE_REPO=$(echo $REC| cut -f2 -d:)
    echo "OLD: https://github.com/ua-gist604b-s25/${OLD_NAME}"
    echo "NEW: https://github.com/ua-gist-open-source/${REFERENCE_REPO}"

    git clone https://github.com/ua-gist604b-f24/${OLD_NAME}.git    
    cd $OLD_NAME 
    git remote set-url origin https://github.com/ua-gist-open-source/${REFERENCE_REPO}
    git push -f -u origin master 
    gh release create spring-2025 --notes "Spring-2025"  --title "Spring 2025" --repo ua-gist-open-source/${REFERENCE_REPO}
    cd ..
done
