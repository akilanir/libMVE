.class Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;
.super Ljava/lang/Object;
.source "ReflectiveEntityConverter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Property"
.end annotation


# instance fields
.field columnType:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

.field field:Ljava/lang/reflect/Field;

.field fieldConverter:Lnl/qbusict/cupboard/convert/FieldConverter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lnl/qbusict/cupboard/convert/FieldConverter",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field name:Ljava/lang/String;

.field type:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 278
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$1;)V
    .registers 2
    .param p1, "x0"    # Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$1;

    .prologue
    .line 278
    invoke-direct {p0}, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter$Property;-><init>()V

    return-void
.end method
