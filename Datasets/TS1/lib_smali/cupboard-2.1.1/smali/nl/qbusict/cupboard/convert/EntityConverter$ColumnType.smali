.class public final enum Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;
.super Ljava/lang/Enum;
.source "EntityConverter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnl/qbusict/cupboard/convert/EntityConverter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ColumnType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

.field public static final enum BLOB:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

.field public static final enum INTEGER:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

.field public static final enum JOIN:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

.field public static final enum REAL:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

.field public static final enum TEXT:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 86
    new-instance v0, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    const-string v1, "TEXT"

    invoke-direct {v0, v1, v2}, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;->TEXT:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    .line 87
    new-instance v0, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    const-string v1, "INTEGER"

    invoke-direct {v0, v1, v3}, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;->INTEGER:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    .line 88
    new-instance v0, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    const-string v1, "REAL"

    invoke-direct {v0, v1, v4}, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;->REAL:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    .line 89
    new-instance v0, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    const-string v1, "BLOB"

    invoke-direct {v0, v1, v5}, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;->BLOB:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    .line 93
    new-instance v0, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    const-string v1, "JOIN"

    invoke-direct {v0, v1, v6}, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;->JOIN:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    .line 85
    const/4 v0, 0x5

    new-array v0, v0, [Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    sget-object v1, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;->TEXT:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    aput-object v1, v0, v2

    sget-object v1, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;->INTEGER:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    aput-object v1, v0, v3

    sget-object v1, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;->REAL:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    aput-object v1, v0, v4

    sget-object v1, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;->BLOB:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    aput-object v1, v0, v5

    sget-object v1, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;->JOIN:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    aput-object v1, v0, v6

    sput-object v0, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;->$VALUES:[Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 85
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 85
    const-class v0, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    return-object v0
.end method

.method public static values()[Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;
    .registers 1

    .prologue
    .line 85
    sget-object v0, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;->$VALUES:[Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    invoke-virtual {v0}, [Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    return-object v0
.end method
