.class public final Lkorex/mail/PasswordAuthentication;
.super Ljava/lang/Object;
.source "PasswordAuthentication.java"


# instance fields
.field private final password:Ljava/lang/String;

.field private final userName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "userName"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-object p1, p0, Lkorex/mail/PasswordAuthentication;->userName:Ljava/lang/String;

    .line 67
    iput-object p2, p0, Lkorex/mail/PasswordAuthentication;->password:Ljava/lang/String;

    .line 68
    return-void
.end method


# virtual methods
.method public getPassword()Ljava/lang/String;
    .registers 2

    .prologue
    .line 81
    iget-object v0, p0, Lkorex/mail/PasswordAuthentication;->password:Ljava/lang/String;

    return-object v0
.end method

.method public getUserName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 74
    iget-object v0, p0, Lkorex/mail/PasswordAuthentication;->userName:Ljava/lang/String;

    return-object v0
.end method
