# Quick script that ensures all the application compile

set -e
export BASE=$PWD/..
export BASE_SPLPATH=$BASE/com.ibm.streamsx.iotf:$HOME/toolkits
export STREAMS_SPLPATH=$BASE_SPLPATH

rm -fr apptest ; mkdir apptest ; cd apptest
sc -a -M com.ibm.streamsx.iotf.apps::IotfOrganization

cd .. ; rm -fr apptest ; mkdir apptest ; cd apptest
sc -a -M com.ibm.streamsx.iotf.apps::SimpleAllDevices

export STREAMS_SPLPATH=$BASE_SPLPATH:$BASE/samples/CountEvents
cd .. ; rm -fr apptest ; mkdir apptest ; cd apptest
sc -a -M com.ibm.streamsx.iotf.sample.countevents::CountEvents

export STREAMS_SPLPATH=$BASE_SPLPATH:$BASE/samples/Quarks
cd .. ; rm -fr apptest ; mkdir apptest ; cd apptest
sc -a -M com.ibm.streamsx.iotf.sample.quarks::IotfSensors

cd .. ; rm -fr apptest
echo "All applications compiled OK"
