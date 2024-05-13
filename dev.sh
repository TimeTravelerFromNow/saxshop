docker build -f dev.dockerfile -t saxshop . &&
docker run -p 3000:3000 -v $(pwd):/rails saxshop

