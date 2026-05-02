.class Lfreemarker/ext/jsp/FreeMarkerJspFactory$1;
.super Ljavax/servlet/jsp/JspEngineInfo;
.source "FreeMarkerJspFactory.java"


# instance fields
.field private final this$0:Lfreemarker/ext/jsp/FreeMarkerJspFactory;


# direct methods
.method constructor <init>(Lfreemarker/ext/jsp/FreeMarkerJspFactory;)V
    .registers 2

    .prologue
    .line 18
    invoke-direct {p0}, Ljavax/servlet/jsp/JspEngineInfo;-><init>()V

    iput-object p1, p0, Lfreemarker/ext/jsp/FreeMarkerJspFactory$1;->this$0:Lfreemarker/ext/jsp/FreeMarkerJspFactory;

    return-void
.end method


# virtual methods
.method public getSpecificationVersion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 20
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerJspFactory$1;->this$0:Lfreemarker/ext/jsp/FreeMarkerJspFactory;

    invoke-virtual {v0}, Lfreemarker/ext/jsp/FreeMarkerJspFactory;->getSpecificationVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
