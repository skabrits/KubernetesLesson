# Запуск кода:

## Pre-requisites:

0. Download VirtualBox

<details>
<summary>Windows Hyper-V</summary>
<br>
To make VirtualBox vms function properly, you must disable Hyper-V and enable windows VMs.

To do that run disable_hyperv.ps1 script in elevated powershell. Also disable memory integrity option in windows security -> core isolation.
</details>

1. Install [Vagrant](https://www.vagrantup.com/downloads) and install vbguest plugin

```
vagrant plugin install vagrant-vbguest
```

2. (optional) Install [kubectl](https://kubernetes.io/docs/tasks/tools/)
3. (optional) Install [GIT](https://git-scm.com/downloads)

## Launching cluster:

0. Create directory where you want script to be stored
1. Open cmd as administrator (jic, as tested)
2. Navigate to directory, using `cd` and once you are there type

<pre>
git clone "<b>Paste_here_link_to_github_repo</b>" .
</pre>

3. Navigate to folder, that contains folder with stable version of K3S HA cluster on Vagrant (K3S-HA-Vagrant)
4. Type

```bash
vagrant up
```

5. It is that easy - you are done
6. (optional) If to use kubectl from dev machine, copy config file at `"K3S-HA-Vagrant/configs/config"` to `$HOME/.kube/config` 
or use `KUBECONFIG` enviroment variable tostore path to config file


# Задача: хай авайлабилити виз комфорт...

Что ж, пора разобраться с мастерами. И не только.

## Мотивация

Кластер требует практики. А ещё его надо обживать, как любую инфраструктуру. Кому понравятся голые стены?

## Описание

0. Сделайте кластер Highly Available, добавив ещё 2 мастеров и создайте отдельную vm с nginx loadbalancer для балансировки нагрузки между мастерами.
1. Разверните Prometheus + Grafana для мониторинга машин кластера. Не забудьте предварительно установить pvc provisioner (например longhorn).
2. Найдите dashboard позволяющий отслеживать основные метрики машин кластера и контейнеров (CPU/MEM).
3. Разверните Elasticsearch + Kibana (они понадобятся в будущем для сбора логов).

## Полезные ссылочки

- [K3S](https://docs.k3s.io/architecture)
- [K3S HA](https://docs.k3s.io/cli/server#:~:text=of%20the%20cluster-,%2D%2Dtls%2Dsan,-value)
- [Nginx LB](https://gabrieltanner.org/blog/ha-kubernetes-cluster-using-k3s/#:~:text=of%20server%20nodes.-,Loadbalancer,-Since%20the%20deployment)
- [12 Factor](https://12factor.net/ru/)