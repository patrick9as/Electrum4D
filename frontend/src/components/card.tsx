import { ReactNode } from "react"

interface Props {
	children: ReactNode
}
export const Card = ({children}: Props) => {
	return <div className="flex items-center justify-center min-h-screen">
      <div className="flex flex-col items-center justify-center bg-white p-6 rounded-lg shadow-lg">
        {children}
      </div>
    </div>
}