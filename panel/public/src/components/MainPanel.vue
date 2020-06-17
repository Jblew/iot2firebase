<template>
  <div>
    <sensor-chart />
  </div>
</template>

<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator';
import { SensorChart } from './sensor-chart';

@Component({
  components: {
    SensorChart,
  }
})
export default class MainPanel extends Vue {
}
</script>

<style scoped>
</style>
