<template>
  <stateful-resource :resource="sensorResource">
    <SensorLineGraph :entries="entries" title="Sensor Data" color="#e6ee9c" />
  </stateful-resource>
</template>

<script lang="ts">
import { Component, Vue, Watch } from 'vue-property-decorator';
import { StatefulResource, Resource } from 'vue-stateful-resource';
import firebase from 'firebase/app';
import { listenForSensorData } from './listenForSensorData';
import SensorLineGraph from './SensorLineGraph.vue';
import { SensorRow } from '../../types';

@Component({
  components: { StatefulResource, SensorLineGraph },
})
export default class SensorChart extends Vue {
  public sensorResource: Resource<SensorRow[]> = Resource.empty();

  get entries(): Array<[string, number]> {
    const raw: SensorRow[] = [...(this.sensorResource.result || [])];
    return raw
      .sort((a, b) => a.timestamp - b.timestamp)
      .map((e) => [entryLabel(e), e.humidityPercent]);
  }

  public beforeMount() {
    listenForSensorData((res) => {
      this.sensorResource = res;
    });
  }
}
function entryLabel(entry: SensorRow) {
  const date = new Date(entry.timestamp);
  return date.toTimeString().substring(0, 12);
}
</script>
<style>
.error {
  color: red;
}
</style>
