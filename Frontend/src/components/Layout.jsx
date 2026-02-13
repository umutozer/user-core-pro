import React from 'react';
import { Link, Outlet, useLocation } from 'react-router-dom';
import { LayoutDashboard, Users, ShieldCheck, ClipboardList, LogOut } from 'lucide-react';
import { useAuth } from '../context/AuthContext';

const NavItem = ({ to, icon: Icon, label, active }) => (
  <Link
    to={to}
    className={`flex items-center space-x-3 px-4 py-3 rounded-lg transition-colors ${ 
      active ? 'bg-primary text-white' : 'text-textColor hover:bg-gray-100'
    }`}
  >
    <Icon size={20} />
    <span className="font-medium">{label}</span>
  </Link>
);

export default function Layout() {
  const { pathname } = useLocation();
  const { logout } = useAuth();

  return (
    <div className="flex h-screen bg-background">
      <aside className="w-64 bg-white border-r border-gray-200 flex flex-col">
        <div className="p-6 border-b border-gray-100">
          <span className="text-xl font-bold text-primary">UserCore<span className="text-secondary">Pro</span></span>
        </div>
        <nav className="flex-1 p-4 space-y-2">
          <NavItem to="/dashboard" icon={LayoutDashboard} label="Dashboard" active={pathname === '/dashboard'} />
          <NavItem to="/users" icon={Users} label="User Management" active={pathname === '/users'} />
          <NavItem to="/roles" icon={ShieldCheck} label="Roles & Permissions" active={pathname === '/roles'} />
          <NavItem to="/logs" icon={ClipboardList} label="Activity Logs" active={pathname === '/logs'} />
        </nav>
        <div className="p-4 border-t border-gray-100">
          <button onClick={logout} className="flex items-center space-x-3 px-4 py-3 w-full text-red-500 hover:bg-red-50 rounded-lg">
            <LogOut size={20} />
            <span className="font-medium">Sign Out</span>
          </button>
        </div>
      </aside>
      <main className="flex-1 overflow-auto p-8">
        <Outlet />
      </main>
    </div>
  );
}