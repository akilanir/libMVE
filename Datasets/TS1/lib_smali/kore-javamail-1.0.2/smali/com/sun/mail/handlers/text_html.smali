.class public Lcom/sun/mail/handlers/text_html;
.super Lcom/sun/mail/handlers/text_plain;
.source "text_html.java"


# static fields
.field private static myDF:Lkorex/activation/ActivationDataFlavor;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 50
    new-instance v0, Lkorex/activation/ActivationDataFlavor;

    const-class v1, Ljava/lang/String;

    const-string v2, "text/html"

    const-string v3, "HTML String"

    invoke-direct {v0, v1, v2, v3}, Lkorex/activation/ActivationDataFlavor;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/sun/mail/handlers/text_html;->myDF:Lkorex/activation/ActivationDataFlavor;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/sun/mail/handlers/text_plain;-><init>()V

    return-void
.end method


# virtual methods
.method protected getDF()Lkorex/activation/ActivationDataFlavor;
    .registers 2

    .prologue
    .line 56
    sget-object v0, Lcom/sun/mail/handlers/text_html;->myDF:Lkorex/activation/ActivationDataFlavor;

    return-object v0
.end method
