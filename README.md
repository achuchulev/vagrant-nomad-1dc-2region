# Nomad located in two DCs in single Region running in Dev mode

### Pre-requisites

- vagrant
- virtualbox
- git

## How to run

##### Get the repo and bring up the environment

```
$ git clone https://github.com/achuchulev/vagrant-nomad-2dc-1region.git
$ cd vagrant-nomad-2dc-1region
$ vagrant up
```

##### `vagrant up` will spin up single virtualbox vm running nomad in dev mode acting as server and client 

### Access nomad

#### via UI

- Click [here](http://localhost:4646) to access Nomad UI

#### via CLI

ssh to nomad vm

```
$ vagrant ssh nomad-dc1
```

### Run nomad job

#### via UI

- go to [jobs](http://localhost:4646/ui/jobs)
- click on `Run job`
- paste or author HCL or JSON to submit to your cluster. A plan will be requested before the job is submitted
- run `Plan`
- review `Job Plan` and `Run` it


#### via CLI

```
$ nomad job run [options] <job file>
```
