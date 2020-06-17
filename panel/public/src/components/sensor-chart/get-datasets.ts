import { SensorRow } from '@/types';
import { ChartDataSets } from 'chart.js';


export function getPointLabels(rows: SensorRow[]): string[] {
  return rows.map((row) => {
    const date = new Date(row.timestamp);
    return date.toTimeString();
  });
}

export function getTemperatureDataset(rows: SensorRow[]): ChartDataSets {
  const series = rows.map((row) => row.temperatureC);
  return { label: 'Temperature [C]', data: series, backgroundColor: '#ff0000' };
}

export function getHumidityDataset(rows: SensorRow[]): ChartDataSets {
  const series = rows.map((row) => row.humidityPercent);
  return { label: 'Humidity [%]', data: series, backgroundColor: '#0000ff' };
}

export function getPressureDataset(rows: SensorRow[]): ChartDataSets {
  const series = rows.map((row) => row.pressureHPa);
  return { label: 'Pressure [hPa]', data: series, backgroundColor: '#00ff00' };
}

