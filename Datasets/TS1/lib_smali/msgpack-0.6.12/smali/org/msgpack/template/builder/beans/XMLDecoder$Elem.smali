.class Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;
.super Ljava/lang/Object;
.source "XMLDecoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/msgpack/template/builder/beans/XMLDecoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Elem"
.end annotation


# instance fields
.field attributes:Lorg/xml/sax/Attributes;

.field fromField:Z

.field fromIndex:Z

.field fromOwner:Z

.field fromProperty:Z

.field id:Ljava/lang/String;

.field idref:Ljava/lang/String;

.field isBasicType:Z

.field isClosed:Z

.field isExecuted:Z

.field isExpression:Z

.field methodName:Ljava/lang/String;

.field result:Ljava/lang/Object;

.field target:Ljava/lang/Object;


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 529
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/msgpack/template/builder/beans/XMLDecoder$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/msgpack/template/builder/beans/XMLDecoder$1;

    .prologue
    .line 529
    invoke-direct {p0}, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;-><init>()V

    return-void
.end method
