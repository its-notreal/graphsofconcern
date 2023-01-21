import { render } from '@redwoodjs/testing/web'

import SimpleLineChart from './SimpleLineChart'

//   Improve this test with help from the Redwood Testing Doc:
//    https://redwoodjs.com/docs/testing#testing-components

describe('SimpleLineChart', () => {
  it('renders successfully', () => {
    expect(() => {
      render(<SimpleLineChart />)
    }).not.toThrow()
  })
})
