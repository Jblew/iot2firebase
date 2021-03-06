<script lang="ts">
import { Component, Mixins, Watch, Prop } from 'vue-property-decorator';
import { Line } from 'vue-chartjs';
import { ChartData, ChartOptions, ChartDataSets } from 'chart.js';
import { getPointLabels, getTemperatureDataset, getHumidityDataset, getPressureDataset, yAxes } from './get-datasets';
import { SensorRow } from '../../types';

@Component
export default class SensorLineGraph extends Mixins(Line) {
  @Prop({ required: true, type: Array })
  public rows!: SensorRow[];

  @Prop({ required: true, type: String })
  public title!: string;

  @Prop({ required: true, type: String })
  public color!: string;

  @Watch('rows')
  public rowsChanged() {
    this.rerender();
  }

  public mounted() {
    this.rerender();
  }

  public rerender() {
    const labels = getPointLabels(this.rows);
    const datasets = [
      getTemperatureDataset(this.rows),
      getHumidityDataset(this.rows),
      getPressureDataset(this.rows),
    ];

    const data: ChartData = {
      labels,
      datasets,
    };

    const timeMin = this.rows.length > 0 ? new Date(this.rows[0].timestamp * 1000) : new Date();

    const options: ChartOptions = {
      maintainAspectRatio: false,
      scales: {
        yAxes,
        xAxes: [{
          type: 'time',
          distribution: 'linear',
          time: {
            min: timeMin.toISOString(),
          },
        }],
      },
    };
    this.renderChart(data, options);
  }
}
</script>
