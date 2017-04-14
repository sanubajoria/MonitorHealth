FROM golang

COPY Dockerfile.run /go/bin/Dockerfile

COPY . /go/src/github.com/mantika/health

WORKDIR /go/src/github.com/mantika/health

RUN go get -v -d ./...

RUN CGO_ENABLED=0 go build -a -installsuffix nocgo -o /go/bin/health .

WORKDIR /go/bin

CMD tar -cf - .
