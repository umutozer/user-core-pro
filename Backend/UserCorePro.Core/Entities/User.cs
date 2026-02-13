using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace UserCorePro.Core.Entities
{
    [Table("users")]
    public class User
    {
        [Key] [Column("id")] public int Id { get; set; }
        [Required] [Column("email")] public string Email { get; set; } = null!;
        [Required] [Column("password_hash")] public string PasswordHash { get; set; } = null!;
        [Required] [Column("first_name")] public string FirstName { get; set; } = null!;
        [Required] [Column("last_name")] public string LastName { get; set; } = null!;
        [Column("phone")] public string? Phone { get; set; }
        [Column("avatar_url")] public string? AvatarUrl { get; set; }
        [Column("status")] public string Status { get; set; } = "active";
        [Column("last_login_at")] public DateTime? LastLoginAt { get; set; }
        [Column("created_at")] public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
        [Column("updated_at")] public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;
    }
}