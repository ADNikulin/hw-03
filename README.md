# 19.3 Облачная инфраструктура. Terraform.  Никулин Александр
# Домашнее задание к занятию «Управляющие конструкции в коде Terraform»

<details>

  <summary>Исходники задания</summary>

  # hw-03
  https://github.com/netology-code/ter-homeworks/blob/main/03/hw-03.md

</details>


### Цели задания

1. Отработать основные принципы и методы работы с управляющими конструкциями Terraform.
2. Освоить работу с шаблонизатором Terraform (Interpolation Syntax).

### Чек-лист готовности к домашнему заданию

<details>

  <summary>Детали</summary>

  1. Зарегистрирован аккаунт в Yandex Cloud. Использован промокод на грант.
  2. Установлен инструмент Yandex CLI.
  3. Доступен исходный код для выполнения задания в директории [**03/src**](https://github.com/netology-code/ter-homeworks/tree/main/03/src).
  4. Любые ВМ, использованные при выполнении задания, должны быть прерываемыми, для экономии средств.
     
</details>

### Задание 1
<details>

  <summary>Детали</summary>
  
  1. Изучите проект.
  2. Заполните файл personal.auto.tfvars.
  3. Инициализируйте проект, выполните код. Он выполнится, даже если доступа к preview нет.
  
     Приложите скриншот входящих правил «Группы безопасности» в ЛК Yandex Cloud или скриншот отказа в предоставлении доступа к preview-версии.
     > ![image](https://github.com/user-attachments/assets/e5794ae8-0582-461d-b99f-c7a5af62c3c8)
    
</details>
------

### Задание 2
<details>
  <summary>Детали</summary>
  
  1. Создайте файл count-vm.tf. Опишите в нём создание двух **одинаковых** ВМ  web-1 и web-2 (не web-0 и web-1) с минимальными параметрами, используя мета-аргумент **count loop**. Назначьте ВМ созданную в первом задании группу безопасности.(как это сделать узнайте в документации провайдера yandex/compute_instance )
     > ![image](https://github.com/user-attachments/assets/cf33979f-3ccd-41e9-a42e-0a1dbb62c7d4)
     > ![image](https://github.com/user-attachments/assets/5509a0a0-81f2-4f03-8e32-f4b5593a0010)
     > ![image](https://github.com/user-attachments/assets/cf6a1265-175e-47fe-a678-ae2b9b21d27e)

  3. Создайте файл for_each-vm.tf. Опишите в нём создание двух ВМ для баз данных с именами "main" и "replica" **разных** по cpu/ram/disk_volume , используя мета-аргумент **for_each loop**. Используйте для обеих ВМ одну общую переменную типа:
     ```
     variable "each_vm" {
       type = list(object({  vm_name=string, cpu=number, ram=number, disk_volume=number }))
     }
     ```
     При желании внесите в переменную все возможные параметры.
     > ![image](https://github.com/user-attachments/assets/312e7f19-d96f-4494-b829-0584763bc410)
     > ![image](https://github.com/user-attachments/assets/96df3ec5-fbe8-4e0a-bf14-9248afb1920b)

  4. ВМ из пункта 2.1 должны создаваться после создания ВМ из пункта 2.2.
     > ![image](https://github.com/user-attachments/assets/13827f23-0d02-4c90-93fd-95370040ba02)

  5. Используйте функцию file в local-переменной для считывания ключа ~/.ssh/id_rsa.pub и его последующего использования в блоке metadata, взятому из ДЗ 2.
     > Я чуть по другому сдела... \
     > ![image](https://github.com/user-attachments/assets/cb486ba4-c2db-4c03-836a-f2fee048e5d8) \
     > ![image](https://github.com/user-attachments/assets/77ad4dbd-342f-4d7f-91e7-fb2fe85ddfb0) \
     > ![image](https://github.com/user-attachments/assets/095afa6e-86f8-4502-88e9-989bfbb9c05c) \
     > ![image](https://github.com/user-attachments/assets/65f00f0c-a242-4712-9ab4-c4732cac88e9) \

  6. Инициализируйте проект, выполните код.
     > ![image](https://github.com/user-attachments/assets/9709db65-68c9-4c05-8bf2-1da8f418925c) \
     > ![image](https://github.com/user-attachments/assets/b84657fb-123b-4989-ac30-cc0102327f7a)
  
</details>
------

### Задание 3
<details>
  <summary>Детали</summary>
  
  1. Создайте 3 одинаковых виртуальных диска размером 1 Гб с помощью ресурса yandex_compute_disk и мета-аргумента count в файле **disk_vm.tf** .
     > ![image](https://github.com/user-attachments/assets/9b5a22b7-bd39-40c0-915e-1b291b48452c) \
     > ![image](https://github.com/user-attachments/assets/18b3108f-8a38-48bb-9e5a-289c6e47d200)
  2. Создайте в том же файле **одиночную**(использовать count или for_each запрещено из-за задания №4) ВМ c именем "storage"  . Используйте блок **dynamic secondary_disk{..}** и мета-аргумент for_each для подключения созданных вами дополнительных дисков.
     > ![image](https://github.com/user-attachments/assets/3b8efcd7-c2a8-4d91-a235-fe89ce8af8d7) \
     > ![image](https://github.com/user-attachments/assets/b9473c97-ab03-4fc4-94ee-7cf9172aef2b) \
     > ![image](https://github.com/user-attachments/assets/463c42d4-a9f2-4e8e-9684-5e6866474f69) \
     > ![image](https://github.com/user-attachments/assets/dc12142f-1b73-4bfe-9b51-a76040018aeb)

</details>
------

### Задание 4
<details>
  <summary>Детали</summary>
  
  1. В файле ansible.tf создайте inventory-файл для ansible.
  Используйте функцию tepmplatefile и файл-шаблон для создания ansible inventory-файла из лекции.
  Готовый код возьмите из демонстрации к лекции [**demonstration2**](https://github.com/netology-code/ter-homeworks/tree/main/03/demo).
  Передайте в него в качестве переменных группы виртуальных машин из задания 2.1, 2.2 и 3.2, т. е. 5 ВМ.
  2. Инвентарь должен содержать 3 группы и быть динамическим, т. е. обработать как группу из 2-х ВМ, так и 999 ВМ.
  3. Добавьте в инвентарь переменную  [**fqdn**](https://cloud.yandex.ru/docs/compute/concepts/network#hostname).
     ``` 
     [webservers]
     web-1 ansible_host=<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>
     web-2 ansible_host=<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>
     
     [databases]
     main ansible_host=<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>
     replica ansible_host<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>
     
     [storage]
     storage ansible_host=<внешний ip-адрес> fqdn=<полное доменное имя виртуальной машины>
     ```
     Пример fqdn: ```web1.ru-central1.internal```(в случае указания имени ВМ); ```fhm8k1oojmm5lie8i22a.auto.internal```(в случае автоматической генерации имени ВМ зона изменяется). нужную вам переменную найдите в документации провайдера или terraform console.
  4. Выполните код. Приложите скриншот получившегося файла.
     > ![image](https://github.com/user-attachments/assets/a85c66fb-0bb6-49fd-a075-5a7b9e1ab067)\
     > ![image](https://github.com/user-attachments/assets/29e26563-dc16-4d5d-98ed-37884af91328)\
     > ![image](https://github.com/user-attachments/assets/e7612cbf-5051-483a-838a-a711a9640bf9)\
     > ![image](https://github.com/user-attachments/assets/e703da0a-afbb-448c-a83a-191e7f5e0c81)\
     > всё находится в ветке terraform-03
  
  Для общего зачёта создайте в вашем GitHub-репозитории новую ветку terraform-03. Закоммитьте в эту ветку свой финальный код проекта, пришлите ссылку на коммит.   
  **Удалите все созданные ресурсы**.
  
</details>

------

## Дополнительные задания (со звездочкой*)

**Настоятельно рекомендуем выполнять все задания со звёздочкой.** Они помогут глубже разобраться в материале.   
Задания со звёздочкой дополнительные, не обязательные к выполнению и никак не повлияют на получение вами зачёта по этому домашнему заданию. 

### Задание 5* (необязательное)
<details>
  <summary>Детали</summary>
  
  1. Напишите output, который отобразит ВМ из ваших ресурсов count и for_each в виде списка словарей :
     ``` 
     [
      {
       "name" = 'имя ВМ1'
       "id"   = 'идентификатор ВМ1'
       "fqdn" = 'Внутренний FQDN ВМ1'
      },
      {
       "name" = 'имя ВМ2'
       "id"   = 'идентификатор ВМ2'
       "fqdn" = 'Внутренний FQDN ВМ2'
      },
      ....
     ...итд любое количество ВМ в ресурсе(те требуется итерация по ресурсам, а не хардкод) !!!!!!!!!!!!!!!!!!!!!
     ]
     ```
     Приложите скриншот вывода команды ```terrafrom output```.

     > ![image](https://github.com/user-attachments/assets/d8d03dc7-a2d2-4837-9840-1ce55bf923e8)
     > всё находится в ветке terraform-03
  
</details>
------

### Задание 6* (необязательное)
<details>
  <summary>Детали</summary>
  
  1. Используя null_resource и local-exec, примените ansible-playbook к ВМ из ansible inventory-файла.
  Готовый код возьмите из демонстрации к лекции [**demonstration2**](https://github.com/netology-code/ter-homeworks/tree/main/03/demo).
  3. Модифицируйте файл-шаблон hosts.tftpl. Необходимо отредактировать переменную ```ansible_host="<внешний IP-address или внутренний IP-address если у ВМ отсутвует внешний адрес>```.
  
  Для проверки работы уберите у ВМ внешние адреса(nat=false). Этот вариант используется при работе через bastion-сервер.
  Для зачёта предоставьте код вместе с основной частью задания.

  > Результат выполнения \
  > ![image](https://github.com/user-attachments/assets/500ae844-8529-4cd5-88c9-4ca9676607a1) \
  > В кратце скатал все файлы, подправил `ansible.tf`
  > всё находится в ветке terraform-03-</details>

### Правила приёма работы

В своём git-репозитории создайте новую ветку terraform-03, закоммитьте в эту ветку свой финальный код проекта. Ответы на задания и необходимые скриншоты оформите в md-файле в ветке terraform-03.

В качестве результата прикрепите ссылку на ветку terraform-03 в вашем репозитории.

Важно. Удалите все созданные ресурсы.

### Задание 7* (необязательное)
<details>
  <summary>Детали</summary>
  
  Ваш код возвращает вам следущий набор данных: 
  ```
  > local.vpc
  {
    "network_id" = "enp7i560tb28nageq0cc"
    "subnet_ids" = [
      "e9b0le401619ngf4h68n",
      "e2lbar6u8b2ftd7f5hia",
      "b0ca48coorjjq93u36pl",
      "fl8ner8rjsio6rcpcf0h",
    ]
    "subnet_zones" = [
      "ru-central1-a",
      "ru-central1-b",
      "ru-central1-c",
      "ru-central1-d",
    ]
  }
  ```
  Предложите выражение в terraform console, которое удалит из данной переменной 3 элемент из: subnet_ids и subnet_zones.(значения могут быть любыми) Образец конечного результата:
  ```
  > <некое выражение>
  {
    "network_id" = "enp7i560tb28nageq0cc"
    "subnet_ids" = [
      "e9b0le401619ngf4h68n",
      "e2lbar6u8b2ftd7f5hia",
      "fl8ner8rjsio6rcpcf0h",
    ]
    "subnet_zones" = [
      "ru-central1-a",
      "ru-central1-b",
      "ru-central1-d",
    ]
  }
  ```

  > ![image](https://github.com/user-attachments/assets/732fbf6d-4b69-46da-ac42-b9a18e3967af)
  > `merge(local.taks7, {"subnet_ids": [for e, i in local.taks7.subnet_ids : i if e != 3]}, {"subnet_zones": [for e, i in local.taks7.subnet_zones : i if e != 3]})` \
  > Самое быстрое что пришло на ум

</details>
