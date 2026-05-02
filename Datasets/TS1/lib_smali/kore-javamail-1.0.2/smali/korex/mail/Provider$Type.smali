.class public Lkorex/mail/Provider$Type;
.super Ljava/lang/Object;
.source "Provider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkorex/mail/Provider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Type"
.end annotation


# static fields
.field public static final STORE:Lkorex/mail/Provider$Type;

.field public static final TRANSPORT:Lkorex/mail/Provider$Type;


# instance fields
.field private type:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 63
    new-instance v0, Lkorex/mail/Provider$Type;

    const-string v1, "STORE"

    invoke-direct {v0, v1}, Lkorex/mail/Provider$Type;-><init>(Ljava/lang/String;)V

    sput-object v0, Lkorex/mail/Provider$Type;->STORE:Lkorex/mail/Provider$Type;

    .line 64
    new-instance v0, Lkorex/mail/Provider$Type;

    const-string v1, "TRANSPORT"

    invoke-direct {v0, v1}, Lkorex/mail/Provider$Type;-><init>(Ljava/lang/String;)V

    sput-object v0, Lkorex/mail/Provider$Type;->TRANSPORT:Lkorex/mail/Provider$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p1, p0, Lkorex/mail/Provider$Type;->type:Ljava/lang/String;

    .line 70
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lkorex/mail/Provider$Type;->type:Ljava/lang/String;

    return-object v0
.end method
