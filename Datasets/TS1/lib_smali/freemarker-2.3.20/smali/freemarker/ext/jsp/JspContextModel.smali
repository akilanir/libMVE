.class Lfreemarker/ext/jsp/JspContextModel;
.super Ljava/lang/Object;
.source "JspContextModel.java"

# interfaces
.implements Lfreemarker/template/TemplateHashModel;


# static fields
.field public static final ANY_SCOPE:I = -0x1

.field public static final APPLICATION_SCOPE:I = 0x4

.field public static final PAGE_SCOPE:I = 0x1

.field public static final REQUEST_SCOPE:I = 0x2

.field public static final SESSION_SCOPE:I = 0x3


# instance fields
.field private final pageContext:Ljavax/servlet/jsp/PageContext;

.field private final scope:I


# direct methods
.method public constructor <init>(Ljavax/servlet/jsp/PageContext;I)V
    .registers 3
    .param p1, "pageContext"    # Ljavax/servlet/jsp/PageContext;
    .param p2, "scope"    # I

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    iput-object p1, p0, Lfreemarker/ext/jsp/JspContextModel;->pageContext:Ljavax/servlet/jsp/PageContext;

    .line 78
    iput p2, p0, Lfreemarker/ext/jsp/JspContextModel;->scope:I

    .line 79
    return-void
.end method


# virtual methods
.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 83
    iget v1, p0, Lfreemarker/ext/jsp/JspContextModel;->scope:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_14

    iget-object v1, p0, Lfreemarker/ext/jsp/JspContextModel;->pageContext:Ljavax/servlet/jsp/PageContext;

    invoke-virtual {v1, p1}, Ljavax/servlet/jsp/PageContext;->findAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 84
    .local v0, "bean":Ljava/lang/Object;
    :goto_b
    invoke-static {}, Lfreemarker/ext/beans/BeansWrapper;->getDefaultInstance()Lfreemarker/ext/beans/BeansWrapper;

    move-result-object v1

    invoke-virtual {v1, v0}, Lfreemarker/ext/beans/BeansWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v1

    return-object v1

    .line 83
    .end local v0    # "bean":Ljava/lang/Object;
    :cond_14
    iget-object v1, p0, Lfreemarker/ext/jsp/JspContextModel;->pageContext:Ljavax/servlet/jsp/PageContext;

    iget v2, p0, Lfreemarker/ext/jsp/JspContextModel;->scope:I

    invoke-virtual {v1, p1, v2}, Ljavax/servlet/jsp/PageContext;->getAttribute(Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v0

    goto :goto_b
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 89
    const/4 v0, 0x0

    return v0
.end method
