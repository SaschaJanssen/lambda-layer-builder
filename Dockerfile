FROM public.ecr.aws/lambda/python:3.9 

RUN yum update -y && \
	 yum install zip -y && \
	 yum clean all

WORKDIR /var/task

ENTRYPOINT ["./resolve_dependencies.sh"]
