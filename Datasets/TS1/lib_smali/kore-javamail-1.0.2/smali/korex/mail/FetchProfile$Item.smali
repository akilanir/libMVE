.class public Lkorex/mail/FetchProfile$Item;
.super Ljava/lang/Object;
.source "FetchProfile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkorex/mail/FetchProfile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Item"
.end annotation


# static fields
.field public static final CONTENT_INFO:Lkorex/mail/FetchProfile$Item;

.field public static final ENVELOPE:Lkorex/mail/FetchProfile$Item;

.field public static final FLAGS:Lkorex/mail/FetchProfile$Item;

.field public static final SIZE:Lkorex/mail/FetchProfile$Item;


# instance fields
.field private name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 116
    new-instance v0, Lkorex/mail/FetchProfile$Item;

    const-string v1, "ENVELOPE"

    invoke-direct {v0, v1}, Lkorex/mail/FetchProfile$Item;-><init>(Ljava/lang/String;)V

    sput-object v0, Lkorex/mail/FetchProfile$Item;->ENVELOPE:Lkorex/mail/FetchProfile$Item;

    .line 128
    new-instance v0, Lkorex/mail/FetchProfile$Item;

    const-string v1, "CONTENT_INFO"

    invoke-direct {v0, v1}, Lkorex/mail/FetchProfile$Item;-><init>(Ljava/lang/String;)V

    sput-object v0, Lkorex/mail/FetchProfile$Item;->CONTENT_INFO:Lkorex/mail/FetchProfile$Item;

    .line 138
    new-instance v0, Lkorex/mail/FetchProfile$Item;

    const-string v1, "SIZE"

    invoke-direct {v0, v1}, Lkorex/mail/FetchProfile$Item;-><init>(Ljava/lang/String;)V

    sput-object v0, Lkorex/mail/FetchProfile$Item;->SIZE:Lkorex/mail/FetchProfile$Item;

    .line 143
    new-instance v0, Lkorex/mail/FetchProfile$Item;

    const-string v1, "FLAGS"

    invoke-direct {v0, v1}, Lkorex/mail/FetchProfile$Item;-><init>(Ljava/lang/String;)V

    sput-object v0, Lkorex/mail/FetchProfile$Item;->FLAGS:Lkorex/mail/FetchProfile$Item;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 153
    iput-object p1, p0, Lkorex/mail/FetchProfile$Item;->name:Ljava/lang/String;

    .line 154
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 160
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lkorex/mail/FetchProfile$Item;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
