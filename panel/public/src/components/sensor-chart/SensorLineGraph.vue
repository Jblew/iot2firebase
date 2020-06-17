<script lang="ts">
import { Component, Mixins, Watch, Prop } from 'vue-property-decorator';
import { Bar } from 'vue-chartjs';
import { ChartData, ChartOptions, ChartDataSets } from 'chart.js';

@Component
export default class SensorLineGraph extends Mixins(Bar) {
  @Prop({ required: true, type: Array })
  public entries!: CostBarEntry[];

  @Prop({ required: true, type: String })
  public title!: string;

  @Prop({ required: true, type: String })
  public color!: string;

  @Watch('entries')
  public entriesChanged() {
    this.rerender();
  }

  public mounted() {
    this.rerender();
  }

  public rerender() {
    const labels = this.entries.map((entry) => entry[0]);
    const series = this.entries.map((entry) => entry[1]);

    const dataset: ChartDataSets = { label: this.title, data: series, backgroundColor: this.color };
    const data: ChartData = {
      labels,
      datasets: [dataset],
    };

    const options: ChartOptions = {
      maintainAspectRatio: false,
      scales: {
        yAxes: [{ ticks: { beginAtZero: true } }],
      },
    };
    this.renderChart(data, options);
  }
}

type CostBarEntry = [string, number];
</script>
