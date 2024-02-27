package model

import "gorm.io/gorm"

// 收藏夹
type Favorite struct {
	gorm.Model

	User      User    `gorm:"foreignKey:UserId"`
	UserID    uint    `gorm:"not null"`
	Product   Product `gorm:"foreignKey:ProductId"`
	ProductID uint    `gorm:"not null"`
	Boss      User    `gorm:"foreignKey:BossId"`
	BossID    uint    `gorm:"not null"`
}
