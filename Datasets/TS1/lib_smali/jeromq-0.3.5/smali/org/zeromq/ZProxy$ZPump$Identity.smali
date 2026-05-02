.class Lorg/zeromq/ZProxy$ZPump$Identity;
.super Ljava/lang/Object;
.source "ZProxy.java"

# interfaces
.implements Lorg/zeromq/ZProxy$ZPump$Transformer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZProxy$ZPump;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Identity"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 1001
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/zeromq/ZProxy$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/zeromq/ZProxy$1;

    .prologue
    .line 1001
    invoke-direct {p0}, Lorg/zeromq/ZProxy$ZPump$Identity;-><init>()V

    return-void
.end method


# virtual methods
.method public transform(Lorg/zeromq/ZMsg;Lorg/zeromq/ZProxy$Plug;Lorg/zeromq/ZProxy$Plug;)Lorg/zeromq/ZMsg;
    .registers 4
    .param p1, "msg"    # Lorg/zeromq/ZMsg;
    .param p2, "src"    # Lorg/zeromq/ZProxy$Plug;
    .param p3, "dst"    # Lorg/zeromq/ZProxy$Plug;

    .prologue
    .line 1006
    return-object p1
.end method
