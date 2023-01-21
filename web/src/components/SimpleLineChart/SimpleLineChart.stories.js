// When you've added props to your component,
// pass Storybook's `args` through this story to control it from the addons panel:
//
// ```jsx
// export const generated = (args) => {
//   return <SimpleLineChart {...args} />
// }
// ```
//
// See https://storybook.js.org/docs/react/writing-stories/args.

import SimpleLineChart from './SimpleLineChart'

export const generated = () => {
  return <SimpleLineChart />
}

export default {
  title: 'Components/SimpleLineChart',
  component: SimpleLineChart,
}
