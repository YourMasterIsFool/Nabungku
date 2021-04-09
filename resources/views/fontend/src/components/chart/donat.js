import { Doughnut, mixins } from 'vue-chartjs'
const { reactiveProp } = mixins;

export default {
  extends: Doughnut,
  components: {
    Doughnut
  },
  mixins: [
  reactiveProp
  ],
  data: () => ({
    chartdata: {
    
      datasets: [
        {
          label: 'Data One',
          data: [],
          backgroundColor: '#505464'
        }
      ]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false
    }
  }),
  methods: {
      parsingData() {
        const chart = {
        
          datasets: [
            {
              label: 'Data One',
              data: [],
              backgroundColor: '#505464'
            }
          ]
      }
        return  chart
    },
  
  
  },
  created() {

    this.parsingData()
  },
  mounted () {
    this.renderChart(this.chartData,this.options)
  },

  watch: {
    chartData() {
      this.$data._chart.update();
    }
  }


}