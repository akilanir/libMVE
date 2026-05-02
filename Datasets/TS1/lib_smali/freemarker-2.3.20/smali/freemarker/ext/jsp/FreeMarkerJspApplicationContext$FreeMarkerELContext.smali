.class Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext;
.super Ljavax/el/ELContext;
.source "FreeMarkerJspApplicationContext.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FreeMarkerELContext"
.end annotation


# instance fields
.field private final pageCtx:Lfreemarker/ext/jsp/FreeMarkerPageContext;

.field private final this$0:Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;


# direct methods
.method constructor <init>(Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;Lfreemarker/ext/jsp/FreeMarkerPageContext;)V
    .registers 3
    .param p2, "pageCtx"    # Lfreemarker/ext/jsp/FreeMarkerPageContext;

    .prologue
    .line 110
    invoke-direct {p0}, Ljavax/el/ELContext;-><init>()V

    iput-object p1, p0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext;->this$0:Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;

    .line 111
    iput-object p2, p0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext;->pageCtx:Lfreemarker/ext/jsp/FreeMarkerPageContext;

    .line 112
    return-void
.end method

.method static access$100(Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext;)Lfreemarker/ext/jsp/FreeMarkerPageContext;
    .registers 2
    .param p0, "x0"    # Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext;

    .prologue
    .line 107
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext;->pageCtx:Lfreemarker/ext/jsp/FreeMarkerPageContext;

    return-object v0
.end method


# virtual methods
.method public getELResolver()Ljavax/el/ELResolver;
    .registers 2

    .prologue
    .line 115
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext;->this$0:Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;

    invoke-static {v0}, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->access$000(Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;)Ljavax/el/CompositeELResolver;

    move-result-object v0

    return-object v0
.end method

.method public getFunctionMapper()Ljavax/el/FunctionMapper;
    .registers 2

    .prologue
    .line 119
    const/4 v0, 0x0

    return-object v0
.end method

.method public getVariableMapper()Ljavax/el/VariableMapper;
    .registers 2

    .prologue
    .line 123
    new-instance v0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext$1;

    invoke-direct {v0, p0}, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext$1;-><init>(Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext;)V

    return-object v0
.end method
