#!/usr/bin/env sh
# Copyright (C) 2023 Lukas Vrabec, <lvrabec@redhat.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

echo "
OCP Demo
"

# prepare env for demo

# start demo
echo ""
echo "Demo start"
echo ""

read -p "oc status"
echo ""
oc status
echo ""

read -p "oc version"
echo ""
oc version
echo ""

read -p "oc create -f https://raw.githubusercontent.com/wrabcak/ocp-security-demo/main/selinux-mls/pod-mcs-same.yaml"
echo ""
oc create -f https://raw.githubusercontent.com/wrabcak/ocp-security-demo/main/selinux-mls/pod-mcs-same.yaml
echo ""

read -p "oc exec -c coke beverages -- touch /volume/coke-was-here"
echo ""
oc exec -c coke beverages -- touch /volume/coke-was-here
echo ""

read -p "oc exec -c pepsi beverages -- touch /volume/pepsi-was-here"
echo ""
oc exec -c pepsi beverages -- touch /volume/pepsi-was-here
echo ""

read -p "oc exec -c pepsi beverages -- ls -Z /volume"
echo ""
oc exec -c pepsi beverages -- ls -Z /volume
echo ""

read -p "oc delete pod beverages"
echo ""
oc delete pod beverages
echo ""

read -p "oc create -f https://raw.githubusercontent.com/wrabcak/ocp-security-demo/main/selinux-mls/pod-mcs-differ.yaml"
echo ""
oc create -f https://raw.githubusercontent.com/wrabcak/ocp-security-demo/main/selinux-mls/pod-mcs-differ.yaml
echo ""

read -p "oc exec -c coke beverages -- touch /volume/coke-was-here"
echo ""
oc exec -c coke beverages -- touch /volume/coke-was-here
echo ""

read -p "oc exec -c pepsi beverages -- touch /volume/pepsi-was-here"
echo ""
oc exec -c pepsi beverages -- touch /volume/pepsi-was-here
echo ""

read -p "oc exec -c pepsi beverages -- ls -Z /volume"
echo ""
oc exec -c pepsi beverages -- ls -Z /volume
echo ""

read -p "oc exec -c coke beverages -- ls -Z /volume"
echo ""
oc exec -c coke beverages -- ls -Z /volume
echo ""

echo ""
echo "Demo end."
echo ""

echo ""
echo "Clean phase"
echo ""

oc delete pod beverages

