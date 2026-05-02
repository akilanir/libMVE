package ch.qos.logback.classic.spi;

import ch.qos.logback.classic.LoggerContext;
import java.io.Serializable;
import java.util.Map;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/spi/LoggerContextVO.class */
public class LoggerContextVO implements Serializable {
    private static final long serialVersionUID = 5488023392483144387L;
    final String name;
    final Map<String, String> propertyMap;
    final long birthTime;

    public LoggerContextVO(LoggerContext loggerContext) {
        this.name = loggerContext.getName();
        this.propertyMap = loggerContext.getCopyOfPropertyMap();
        this.birthTime = loggerContext.getBirthTime();
    }

    public LoggerContextVO(String str, Map<String, String> map, long j) {
        this.name = str;
        this.propertyMap = map;
        this.birthTime = j;
    }

    public String getName() {
        return this.name;
    }

    public Map<String, String> getPropertyMap() {
        return this.propertyMap;
    }

    public long getBirthTime() {
        return this.birthTime;
    }

    public String toString() {
        return "LoggerContextVO{name='" + this.name + "', propertyMap=" + this.propertyMap + ", birthTime=" + this.birthTime + '}';
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof LoggerContextVO)) {
            return false;
        }
        LoggerContextVO loggerContextVO = (LoggerContextVO) obj;
        if (this.birthTime != loggerContextVO.birthTime) {
            return false;
        }
        if (this.name != null) {
            if (!this.name.equals(loggerContextVO.name)) {
                return false;
            }
        } else if (loggerContextVO.name != null) {
            return false;
        }
        return this.propertyMap != null ? this.propertyMap.equals(loggerContextVO.propertyMap) : loggerContextVO.propertyMap == null;
    }

    public int hashCode() {
        return (31 * ((31 * (this.name != null ? this.name.hashCode() : 0)) + (this.propertyMap != null ? this.propertyMap.hashCode() : 0))) + ((int) (this.birthTime ^ (this.birthTime >>> 32)));
    }
}
