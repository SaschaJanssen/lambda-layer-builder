FROM lambci/lambda:build-python3.7 

WORKDIR /var/task

ENTRYPOINT ["./resolve_dependencies.sh"]