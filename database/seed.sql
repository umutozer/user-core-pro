-- ROLES
INSERT INTO roles (name, display_name, description) VALUES
('super_admin', 'Super Administrator', 'Full system access'),
('admin', 'Administrator', 'Manage users and roles'),
('moderator', 'Moderator', 'Manage content and users'),
('viewer', 'Viewer', 'Read-only access');

-- PERMISSIONS
INSERT INTO permissions (name, display_name, resource, action) VALUES
('user_create', 'Create User', 'user', 'create'),
('user_read', 'View User', 'user', 'read'),
('user_update', 'Update User', 'user', 'update'),
('user_delete', 'Delete User', 'user', 'delete'),
('role_create', 'Create Role', 'role', 'create'),
('role_read', 'View Role', 'role', 'read'),
('role_update', 'Update Role', 'role', 'update'),
('role_delete', 'Delete Role', 'role', 'delete'),
('activity_read', 'View Activity Logs', 'activity', 'read'),
('activity_delete', 'Delete Activity Logs', 'activity', 'delete');

-- ROLE-PERMISSION MAPPINGS
INSERT INTO role_permissions (role_id, permission_id)
SELECT r.id, p.id
FROM roles r, permissions p
WHERE r.name = 'super_admin';

INSERT INTO role_permissions (role_id, permission_id)
SELECT r.id, p.id
FROM roles r, permissions p
WHERE r.name = 'admin' AND p.resource IN ('user','role');

INSERT INTO role_permissions (role_id, permission_id)
SELECT r.id, p.id
FROM roles r, permissions p
WHERE r.name = 'moderator' AND p.resource = 'user';

INSERT INTO role_permissions (role_id, permission_id)
SELECT r.id, p.id
FROM roles r, permissions p
WHERE r.name = 'viewer' AND p.action = 'read';

-- USERS
INSERT INTO users (email, password_hash, first_name, last_name, phone, status) VALUES
('super@admin.com', '$2a$11$XjM4J2lTpJdKi4m5qMfQbO6Z3z9s3Y8Y9Y9Y9Y9Y9Y9Y9Y9Y9Y9Y9Y9', 'Super', 'Admin', '+905551234567', 'active'),
('john@doe.com', '$2a$11$XjM4J2lTpJdKi4m5qMfQbO6Z3z9s3Y8Y9Y9Y9Y9Y9Y9Y9Y9Y9Y9Y9', 'John', 'Doe', '+905558765432', 'active'),
('jane@smith.com', '$2a$11$XjM4J2lTpJdKi4m5qMfQbO6Z3z9s3Y8Y9Y9Y9Y9Y9Y9Y9Y9Y9Y9Y9', 'Jane', 'Smith', '+905554567890', 'active'),
('bob@martin.com', '$2a$11$XjM4J2lTpJdKi4m5qMfQbO6Z3z9s3Y8Y9Y9Y9Y9Y9Y9Y9Y9Y9Y9Y9', 'Bob', 'Martin', '+905551234321', 'passive'),
('alice@brown.com', '$2a$11$XjM4J2lTpJdKi4m5qMfQbO6Z3z9s3Y8Y9Y9Y9Y9Y9Y9Y9Y9Y9Y9Y9', 'Alice', 'Brown', '+905556543210', 'active');

-- USER-ROLE MAPPINGS
INSERT INTO user_roles (user_id, role_id)
SELECT u.id, r.id
FROM users u, roles r
WHERE u.email = 'super@admin.com' AND r.name = 'super_admin';

INSERT INTO user_roles (user_id, role_id)
SELECT u.id, r.id
FROM users u, roles r
WHERE u.email IN ('john@doe.com','jane@smith.com') AND r.name = 'admin';

INSERT INTO user_roles (user_id, role_id)
SELECT u.id, r.id
FROM users u, roles r
WHERE u.email = 'bob@martin.com' AND r.name = 'moderator';

INSERT INTO user_roles (user_id, role_id)
SELECT u.id, r.id
FROM users u, roles r
WHERE u.email = 'alice@brown.com' AND r.name = 'viewer';

-- ACTIVITY LOGS
INSERT INTO activity_logs (user_id, action, resource_type, resource_id, ip_address, user_agent) VALUES
(1, 'user_login', 'user', 1, '192.168.1.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'),
(1, 'user_create', 'user', 2, '192.168.1.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'),
(2, 'user_login', 'user', 2, '192.168.1.15', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36'),
(2, 'user_update', 'user', 3, '192.168.1.15', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36'),
(3, 'user_login', 'user', 3, '192.168.1.20', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_6 like Mac OS X) AppleWebKit/605.1.15');