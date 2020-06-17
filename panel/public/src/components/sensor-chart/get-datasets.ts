import { SensorRow } from '@/types';
import { ChartDataSets } from 'chart.js';


export function getPointLabels(rows: SensorRow[]): string[] {
  return rows.map((row) => {
    const date = new Date(row.timestamp * 1000);
    return `${date.getHours()}:${date.getMinutes()}`;
  });
}

export function getTemperatureDataset(rows: SensorRow[]): ChartDataSets {
  const series = rows.map((row) => row.temperatureC);
  return {
    label: 'Temperature [C]',
    data: series,
    fill: false,
    borderColor: '#ff0000',
    yAxisID: 'temperature',
  };
}

export function getHumidityDataset(rows: SensorRow[]): ChartDataSets {
  const series = rows.map((row) => row.humidityPercent);
  return {
    label: 'Humidity [%]',
    data: series,
    fill: false,
    borderColor: '#0000ff',
    yAxisID: 'humidity',
  };
}

export function getPressureDataset(rows: SensorRow[]): ChartDataSets {
  const series = rows.map((row) => row.pressureHPa);
  return {
    label: 'Pressure [hPa]',
    data: series,
    fill: false,
    borderColor: '#00aa00',
    yAxisID: 'pressure',
  };
}

export const yAxes = [
  {
    id: 'temperature',
    scaleLabel: {
      labelString: 'Temperature [C]',
      fontColor: '#ff0000',
      display: true,
    },
    ticks: {
      beginAtZero: true,
      min: 0,
      max: 40,
    },
  },
  {
    id: 'humidity',
    position: 'right',
    scaleLabel: {
      labelString: 'Relative humidity [%]',
      fontColor: '#0000ff',
      display: true,
    },
    ticks: {
      beginAtZero: true,
      min: 0,
      max: 100,
    },
  },
  {
    id: 'pressure',
    scaleLabel: {
      labelString: 'Pressure [hPa]',
      fontColor: '#00aa00',
      display: true,
    },
    ticks: {
      beginAtZero: true,
      min: 900,
      max: 1100,
    },
  },
];
