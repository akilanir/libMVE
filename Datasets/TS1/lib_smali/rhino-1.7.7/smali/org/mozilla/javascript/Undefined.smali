.class public Lorg/mozilla/javascript/Undefined;
.super Ljava/lang/Object;
.source "Undefined.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final instance:Ljava/lang/Object;

.field static final serialVersionUID:J = 0x7f9d9ecff72acbbfL


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 18
    new-instance v0, Lorg/mozilla/javascript/Undefined;

    invoke-direct {v0}, Lorg/mozilla/javascript/Undefined;-><init>()V

    sput-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    return-void
.end method


# virtual methods
.method public readResolve()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 26
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    return-object v0
.end method
