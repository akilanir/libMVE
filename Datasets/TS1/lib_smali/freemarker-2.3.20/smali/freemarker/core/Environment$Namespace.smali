.class public Lfreemarker/core/Environment$Namespace;
.super Lfreemarker/template/SimpleHash;
.source "Environment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/Environment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Namespace"
.end annotation


# instance fields
.field private template:Lfreemarker/template/Template;

.field private final this$0:Lfreemarker/core/Environment;


# direct methods
.method constructor <init>(Lfreemarker/core/Environment;)V
    .registers 3

    .prologue
    .line 1907
    invoke-direct {p0}, Lfreemarker/template/SimpleHash;-><init>()V

    iput-object p1, p0, Lfreemarker/core/Environment$Namespace;->this$0:Lfreemarker/core/Environment;

    .line 1908
    invoke-virtual {p1}, Lfreemarker/core/Environment;->getTemplate()Lfreemarker/template/Template;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/core/Environment$Namespace;->template:Lfreemarker/template/Template;

    .line 1909
    return-void
.end method

.method constructor <init>(Lfreemarker/core/Environment;Lfreemarker/template/Template;)V
    .registers 3
    .param p2, "template"    # Lfreemarker/template/Template;

    .prologue
    .line 1911
    invoke-direct {p0}, Lfreemarker/template/SimpleHash;-><init>()V

    iput-object p1, p0, Lfreemarker/core/Environment$Namespace;->this$0:Lfreemarker/core/Environment;

    .line 1912
    iput-object p2, p0, Lfreemarker/core/Environment$Namespace;->template:Lfreemarker/template/Template;

    .line 1913
    return-void
.end method


# virtual methods
.method public getTemplate()Lfreemarker/template/Template;
    .registers 2

    .prologue
    .line 1919
    iget-object v0, p0, Lfreemarker/core/Environment$Namespace;->template:Lfreemarker/template/Template;

    if-nez v0, :cond_b

    iget-object v0, p0, Lfreemarker/core/Environment$Namespace;->this$0:Lfreemarker/core/Environment;

    invoke-virtual {v0}, Lfreemarker/core/Environment;->getTemplate()Lfreemarker/template/Template;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    iget-object v0, p0, Lfreemarker/core/Environment$Namespace;->template:Lfreemarker/template/Template;

    goto :goto_a
.end method
