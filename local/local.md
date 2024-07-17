# Task Manager  - Local -

[*back*](../README.md)

## Instructions

Access `local` folder in order to run local scripts.

We've created an script to run everything locally. Requirements:

- Podman running
- A directory to store repositories and build applications
- maven (>=3.9.8)

Use this command to take a look at the script manual:

```sh
bash local_setup.sh -h
```

Follow this steps to run applications:

- Configure a director for creating resources or select the directory where repositories are already cloned (in this demo we're ):

```sh
export LOCAL_SETUP_PATH=<CHANGEME>
```

- Clone repositories (skip if needed)
```sh
bash local_setup.sh --path $LOCAL_SETUP_PATH --action clone-repos
```

- Init environment
```sh
bash local_setup.sh --path $LOCAL_SETUP_PATH --action init
```

- Create DataBase
```sh
bash local_setup.sh --path $LOCAL_SETUP_PATH --action database
```

- Create Legacy app
```sh
bash local_setup.sh --path $LOCAL_SETUP_PATH --action legacy
```

- Create Analytics app
```sh
bash local_setup.sh --path $LOCAL_SETUP_PATH --action analytics
```

- Create Analytics ui
```sh
bash local_setup.sh --path $LOCAL_SETUP_PATH --action analytics-ui
```


- Access apps:
  - [Task Manager Legacy app](http://localhost:8080/tasks)
  - [Task Manager Analytics Dashboard](http://localhost:3000/)

[*back*](../README.md)