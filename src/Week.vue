<template>
    <div id="grid" :style="{
      gridTemplateColumns: `repeat(${columns}, 1fr)`
    }">
      <div v-for="(cell, index) in [...Array(rows * columns)]"
        :key="index" :class="{
          [`column-${index % columns}`]: true,
          [`row-${Math.floor(index / columns)}`]: true
        }">
        <template v-if="index === 0">
          <div class="text">
            <h1>
              <div>{{ formatDate(firstDayOfWeek) }}</div>
              <div>{{ formatDate(lastDayOfWeek) }}</div>
            </h1>
            <h3>{{ formatWeek(date) }}</h3>
          </div>
        </template>
        <template v-else-if="index < columns">
          <div class="text">
            <h2>{{ [...people, ...extraColumns][index - 1] }}</h2>
          </div>
        </template>

        <!-- <template v-else-if="index === columns * (rows - 1)">
          <div class="text">
            <h2>
              Totaal
            </h2>
          </div>
        </template> -->

        <!-- <template v-else-if="index > columns * (rows - 1)">
        </template> -->

        <template v-else-if="index % columns === 0">
          <div class="text">
            <h2>
            {{ formatDay(addDays(firstDayOfWeek, index / columns - 1)) }}
            </h2>
            <h3>
            {{ formatDate(addDays(firstDayOfWeek, index / columns - 1)) }}
            </h3>
          </div>
        </template>
        <template v-else>
          <ol class="day">
            <li></li>
            <li></li>
          </ol>
        </template>
      </div>
    </div>

</template>

<script>
import { parse, format, add, startOfWeek, endOfWeek } from 'date-fns'
import { nl } from 'date-fns/locale'

export default {
  name: 'Week',
  props: {
    weekNumber: {
      type: Number,
      default: 1
    }
  },
  data: function () {
    return {
      date: new Date(),
      people: [
        'Sarah',
        'Bert',
        'Lindy',
        'Casper',
        'Lou & Coco'
      ],
      extraColumns: [
        'Gasten / opmerkingen'
      ]
    }
  },
  mounted: function () {
    const date = parse(this.weekNumber, "w", this.date, {
      locale: nl
    })

    this.date = date


    //     this.date = date
    //   } else if (this.$route.query.date) {
    //     const dateStr = this.$route.query.date
    //     const date = parse(dateStr, "d-L-y", this.date, {
    //       locale: nl
    //     })

    //     this.date = date
    //   }
    // },


    //   this.dateFromRoute()
  },
  // watch: {
  //   $route: function () {
  //     this.dateFromRoute()
  //   }
  // },
  computed: {
    columns: function () {
      return this.people.length + 1 + this.extraColumns.length
    },
    rows: function () {
      return 1 + 7
    },
    firstDayOfWeek: function () {
      return this.startOfWeek(this.date)
    },
    lastDayOfWeek: function () {
      return this.endOfWeek(this.date)
    }
  },
  methods: {
    // dateFromRoute: function () {
    //   if (this.$route.query.week) {
    //     const weekStr = this.$route.query.week

    //     const date = parse(weekStr, "w", this.date, {
    //       locale: nl
    //     })

    //     this.date = date
    //   } else if (this.$route.query.date) {
    //     const dateStr = this.$route.query.date
    //     const date = parse(dateStr, "d-L-y", this.date, {
    //       locale: nl
    //     })

    //     this.date = date
    //   }
    // },
    startOfWeek: function (date) {
      return startOfWeek(date, { locale: nl })
    },
    endOfWeek: function (date) {
      return endOfWeek(date, { locale: nl })
    },
    capitalizeFirstLetter: function (string) {
      return string.charAt(0).toUpperCase() + string.slice(1)
    },
    addDays: function (date, days) {
      return add(date, {
        days
      })
    },
    formatWeek: function (date) {
      return format(date, '\'week\' w', { locale: nl })
    },
    formatDate: function (date) {
      return format(date, 'd MMM', { locale: nl }).replace('.', '')
    },
    formatDay: function (date) {
      return format(date, 'eeeeee', { locale: nl })
    }
  }
}
</script>

<style scoped>
#grid {
  width: 100%;
  height: 100%;
  display: grid;
  page-break-after: always;
}

#grid > div:not(.row-0) {
  border-top: 1px solid black;
}

#grid > div:not(.column-0) {
  border-left: 1px solid black;
}

#grid .text {
  padding: .5cm;
}

.column-0 {
  text-align: right;
}

h3 {
  color: #777;
}

ol.day {
  height: 100%;
  width: 100%;
  display: flex;
  flex-direction: column;
  list-style-type: none;
  margin: 0;
  padding: 0;
}

ol.day li {
  margin: 0;
  padding: 0;
  height: 100%;
  flex-shrink: 1;
}

ol.day li:not(:last-child) {
  border-bottom-style: solid;
  border-bottom-color: #aaa;
  border-bottom-width: 1px;
}
</style>
