/** @type {import('tailwindcss').Config} */
export default {
  content: ['./index.html', './src/**/*.{js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        primary: '#3b82f6',
        secondary: '#1e293b',
        accent: '#10b981',
        background: '#f8fafc',
        darkBg: '#0f172a',
        textColor: '#334155',
        lightText: '#f1f5f9'
      },
      fontFamily: {
        sans: ['Inter', 'sans-serif'],
        heading: ['Inter', 'sans-serif']
      }
    },
  },
  plugins: [],
}