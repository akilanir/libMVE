.class Lfreemarker/ext/jsp/FreeMarkerJspFactory2;
.super Lfreemarker/ext/jsp/FreeMarkerJspFactory;
.source "FreeMarkerJspFactory2.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 7
    invoke-direct {p0}, Lfreemarker/ext/jsp/FreeMarkerJspFactory;-><init>()V

    return-void
.end method


# virtual methods
.method protected getSpecificationVersion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 10
    const-string v0, "2.0"

    return-object v0
.end method
