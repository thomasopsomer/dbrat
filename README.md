# Dockerized Brat Server

Easy deployment of the [**brat**](http://brat.nlplab.org/) server for text annotation using docker

## Usage

1. Configuration: Fill `.env` and / or `config.py`

2. Add users in `userlist.txt` with one user + " " + password per line

3. Build image: `docker-compose build`

4. Run the server: `docker-compose up -d`


## Import data collection

Given a corpus of txt files to be annotated. Put the files in a folder in the data directory.
Before starting annotation, *.ann* files needs to be created. You can create them with the following command

```bash
find data -name '*.txt' | sed -e 's|\.txt|.ann|g' | xargs touch
```

## Brat usage

For information about using the tool, see the [manual](http://brat.nlplab.org/manual.html)