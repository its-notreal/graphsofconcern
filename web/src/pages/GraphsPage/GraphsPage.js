import { MetaTags } from '@redwoodjs/web'

import SimpleLineChart from 'src/components/SimpleLineChart/SimpleLineChart'

const GraphsPage = () => {

  return (
    <>
      <MetaTags title="Graphs" description="Graphs" />

      <h1>Graphs</h1>
      <SimpleLineChart />
    </>
  )
}

export default GraphsPage
