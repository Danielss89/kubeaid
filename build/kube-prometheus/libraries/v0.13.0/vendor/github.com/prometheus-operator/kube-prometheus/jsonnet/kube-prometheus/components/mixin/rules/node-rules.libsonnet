{
  prometheusRules+:: {
    groups+: [
      {
        name: 'kube-prometheus-node-recording.rules',
        rules: [
          {
            expr: 'sum(rate(node_cpu_seconds_total{mode!="idle",mode!="iowait",mode!="steal"}[3m])) BY (instance)',
            record: 'instance:node_cpu:rate:sum',
          },
          {
            expr: 'sum(rate(node_network_receive_bytes_total[3m])) BY (instance)',
            record: 'instance:node_network_receive_bytes:rate:sum',
          },
          {
            expr: 'sum(rate(node_network_transmit_bytes_total[3m])) BY (instance)',
            record: 'instance:node_network_transmit_bytes:rate:sum',
          },
          {
            expr: 'sum(rate(node_cpu_seconds_total{mode!="idle",mode!="iowait",mode!="steal"}[5m])) WITHOUT (cpu, mode) / ON(instance) GROUP_LEFT() count(sum(node_cpu_seconds_total) BY (instance, cpu)) BY (instance)',
            record: 'instance:node_cpu:ratio',
          },
          {
            expr: 'sum(rate(node_cpu_seconds_total{mode!="idle",mode!="iowait",mode!="steal"}[5m]))',
            record: 'cluster:node_cpu:sum_rate5m',
          },
          {
            expr: 'cluster:node_cpu:sum_rate5m / count(sum(node_cpu_seconds_total) BY (instance, cpu))',
            record: 'cluster:node_cpu:ratio',
          },
        ],
      },
    ],
  },
}
