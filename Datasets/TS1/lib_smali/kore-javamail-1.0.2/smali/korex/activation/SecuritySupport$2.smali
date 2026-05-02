.class final Lkorex/activation/SecuritySupport$2;
.super Ljava/lang/Object;
.source "SecuritySupport.java"

# interfaces
.implements Ljava/security/PrivilegedExceptionAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkorex/activation/SecuritySupport;->getResourceAsStream(Ljava/lang/Class;Ljava/lang/String;)Ljava/io/InputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$c:Ljava/lang/Class;

.field final synthetic val$name:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/Class;Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 61
    iput-object p1, p0, Lkorex/activation/SecuritySupport$2;->val$c:Ljava/lang/Class;

    iput-object p2, p0, Lkorex/activation/SecuritySupport$2;->val$name:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    iget-object v0, p0, Lkorex/activation/SecuritySupport$2;->val$c:Ljava/lang/Class;

    iget-object v1, p0, Lkorex/activation/SecuritySupport$2;->val$name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method
