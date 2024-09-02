#!/bin/bash

# Получаем список всех принтеров
printers=$(lpstat -p | awk '{print $2}')

# Проверяем, если список принтеров пустой
if [ -z "$printers" ]; then
  echo "Нет доступных принтеров для активации."
  exit 1
fi

# Активируем каждый принтер
for printer in $printers; do
  echo "Активируем принтер: $printer"
  cupsenable "$printer"
done

echo "Все доступные принтеры были активированы."

