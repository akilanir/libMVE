.class final Lfreemarker/debug/impl/RmiDebuggerService$TemplateReference;
.super Ljava/lang/ref/WeakReference;
.source "RmiDebuggerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/debug/impl/RmiDebuggerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "TemplateReference"
.end annotation


# instance fields
.field final templateName:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Lfreemarker/template/Template;Ljava/lang/ref/ReferenceQueue;)V
    .registers 4
    .param p1, "templateName"    # Ljava/lang/String;
    .param p2, "template"    # Lfreemarker/template/Template;
    .param p3, "queue"    # Ljava/lang/ref/ReferenceQueue;

    .prologue
    .line 474
    invoke-direct {p0, p2, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    .line 475
    iput-object p1, p0, Lfreemarker/debug/impl/RmiDebuggerService$TemplateReference;->templateName:Ljava/lang/String;

    .line 476
    return-void
.end method


# virtual methods
.method getTemplate()Lfreemarker/template/Template;
    .registers 2

    .prologue
    .line 480
    invoke-virtual {p0}, Lfreemarker/debug/impl/RmiDebuggerService$TemplateReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/template/Template;

    return-object v0
.end method
