.class public Lnl/qbusict/cupboard/convert/EntityConverter$Column;
.super Ljava/lang/Object;
.source "EntityConverter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnl/qbusict/cupboard/convert/EntityConverter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Column"
.end annotation


# instance fields
.field public final index:Lnl/qbusict/cupboard/annotation/Index;

.field public final name:Ljava/lang/String;

.field public final type:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    .prologue
    .line 111
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lnl/qbusict/cupboard/convert/EntityConverter$Column;-><init>(Ljava/lang/String;Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;Lnl/qbusict/cupboard/annotation/Index;)V

    .line 112
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;Lnl/qbusict/cupboard/annotation/Index;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;
    .param p3, "index"    # Lnl/qbusict/cupboard/annotation/Index;

    .prologue
    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 124
    iput-object p1, p0, Lnl/qbusict/cupboard/convert/EntityConverter$Column;->name:Ljava/lang/String;

    .line 125
    iput-object p2, p0, Lnl/qbusict/cupboard/convert/EntityConverter$Column;->type:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    .line 126
    iput-object p3, p0, Lnl/qbusict/cupboard/convert/EntityConverter$Column;->index:Lnl/qbusict/cupboard/annotation/Index;

    .line 127
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 136
    instance-of v1, p1, Lnl/qbusict/cupboard/convert/EntityConverter$Column;

    if-eqz v1, :cond_1b

    move-object v0, p1

    .line 137
    check-cast v0, Lnl/qbusict/cupboard/convert/EntityConverter$Column;

    .line 138
    .local v0, "c":Lnl/qbusict/cupboard/convert/EntityConverter$Column;
    iget-object v1, v0, Lnl/qbusict/cupboard/convert/EntityConverter$Column;->name:Ljava/lang/String;

    iget-object v2, p0, Lnl/qbusict/cupboard/convert/EntityConverter$Column;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_19

    iget-object v1, v0, Lnl/qbusict/cupboard/convert/EntityConverter$Column;->type:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    iget-object v2, p0, Lnl/qbusict/cupboard/convert/EntityConverter$Column;->type:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    if-ne v1, v2, :cond_19

    const/4 v1, 0x1

    .line 142
    .end local v0    # "c":Lnl/qbusict/cupboard/convert/EntityConverter$Column;
    :goto_18
    return v1

    .line 138
    .restart local v0    # "c":Lnl/qbusict/cupboard/convert/EntityConverter$Column;
    :cond_19
    const/4 v1, 0x0

    goto :goto_18

    .line 139
    .end local v0    # "c":Lnl/qbusict/cupboard/convert/EntityConverter$Column;
    :cond_1b
    instance-of v1, p1, Ljava/lang/String;

    if-eqz v1, :cond_26

    .line 140
    iget-object v1, p0, Lnl/qbusict/cupboard/convert/EntityConverter$Column;->name:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_18

    .line 142
    :cond_26
    invoke-super {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_18
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 131
    iget-object v0, p0, Lnl/qbusict/cupboard/convert/EntityConverter$Column;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x25

    return v0
.end method
