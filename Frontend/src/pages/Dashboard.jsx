import React, { useEffect, useState } from 'react';
import api from '../services/api';
import { Users, Activity, ShieldAlert, CheckCircle } from 'lucide-react';

const StatCard = ({ title, value, icon: Icon, color }) => (
  <div className="bg-white p-6 rounded-xl border border-gray-100 shadow-sm">
    <div className="flex items-center justify-between">
      <div>
        <p className="text-sm text-textColor opacity-70 font-medium">{title}</p>
        <h3 className="text-2xl font-bold mt-1 text-secondary">{value}</h3>
      </div>
      <div className={`p-3 rounded-lg ${color}`}>
        <Icon className="w-6 h-6 text-white" />
      </div>
    </div>
  </div>
);

export default function Dashboard() {
  const [stats, setStats] = useState({ totalUsers: 0, activeUsers: 0, systemHealth: '99%', alerts: 0 });

  useEffect(() => {
    const fetchStats = async () => {
      try {
        const { data } = await api.get('/dashboard/stats');
        setStats(data);
      } catch (err) {
        console.error('Failed to fetch stats');
      }
    };
    fetchStats();
  }, []);

  return (
    <div className="space-y-6">
      <h1 className="text-2xl font-bold text-secondary">Dashboard Overview</h1>
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
        <StatCard title="Total Users" value={stats.totalUsers} icon={Users} color="bg-primary" />
        <StatCard title="Active Users" value={stats.activeUsers} icon={CheckCircle} color="bg-accent" />
        <StatCard title="System Health" value={stats.systemHealth} icon={Activity} color="bg-secondary" />
        <StatCard title="Security Alerts" value={stats.alerts} icon={ShieldAlert} color="bg-red-500" />
      </div>
      
      <div className="bg-white p-6 rounded-xl border border-gray-100 shadow-sm">
        <h2 className="text-lg font-semibold mb-4">Recent Activity</h2>
        <p className="text-textColor opacity-60 italic">Fetching live audit logs...</p>
      </div>
    </div>
  );
}