package com.alibaba.fastjson.support.spring;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializeFilter;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.support.config.FastJsonConfig;
import com.alibaba.fastjson.util.IOUtils;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.util.CollectionUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.servlet.view.AbstractView;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/support/spring/FastJsonJsonView.class */
public class FastJsonJsonView extends AbstractView {
    public static final String DEFAULT_CONTENT_TYPE = "application/json;charset=UTF-8";

    @Deprecated
    protected String dateFormat;
    private Set<String> renderedAttributes;

    @Deprecated
    protected Charset charset = IOUtils.UTF8;

    @Deprecated
    protected SerializerFeature[] features = new SerializerFeature[0];

    @Deprecated
    protected SerializeFilter[] filters = new SerializeFilter[0];
    private boolean disableCaching = true;
    private boolean updateContentLength = false;
    private boolean extractValueFromSingleKeyModel = false;
    private FastJsonConfig fastJsonConfig = new FastJsonConfig();

    public FastJsonJsonView() {
        setContentType(DEFAULT_CONTENT_TYPE);
        setExposePathVariables(false);
    }

    public FastJsonConfig getFastJsonConfig() {
        return this.fastJsonConfig;
    }

    public void setFastJsonConfig(FastJsonConfig fastJsonConfig) {
        this.fastJsonConfig = fastJsonConfig;
    }

    @Deprecated
    public void setSerializerFeature(SerializerFeature... features) {
        this.fastJsonConfig.setSerializerFeatures(features);
    }

    @Deprecated
    public Charset getCharset() {
        return this.fastJsonConfig.getCharset();
    }

    @Deprecated
    public void setCharset(Charset charset) {
        this.fastJsonConfig.setCharset(charset);
    }

    @Deprecated
    public String getDateFormat() {
        return this.fastJsonConfig.getDateFormat();
    }

    @Deprecated
    public void setDateFormat(String dateFormat) {
        this.fastJsonConfig.setDateFormat(dateFormat);
    }

    @Deprecated
    public SerializerFeature[] getFeatures() {
        return this.fastJsonConfig.getSerializerFeatures();
    }

    @Deprecated
    public void setFeatures(SerializerFeature... features) {
        this.fastJsonConfig.setSerializerFeatures(features);
    }

    @Deprecated
    public SerializeFilter[] getFilters() {
        return this.fastJsonConfig.getSerializeFilters();
    }

    @Deprecated
    public void setFilters(SerializeFilter... filters) {
        this.fastJsonConfig.setSerializeFilters(filters);
    }

    public void setRenderedAttributes(Set<String> renderedAttributes) {
        this.renderedAttributes = renderedAttributes;
    }

    public boolean isExtractValueFromSingleKeyModel() {
        return this.extractValueFromSingleKeyModel;
    }

    public void setExtractValueFromSingleKeyModel(boolean extractValueFromSingleKeyModel) {
        this.extractValueFromSingleKeyModel = extractValueFromSingleKeyModel;
    }

    protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Object value = filterModel(model);
        OutputStream stream = this.updateContentLength ? createTemporaryOutputStream() : response.getOutputStream();
        JSON.writeJSONString(stream, this.fastJsonConfig.getCharset(), value, this.fastJsonConfig.getSerializeConfig(), this.fastJsonConfig.getSerializeFilters(), this.fastJsonConfig.getDateFormat(), JSON.DEFAULT_GENERATE_FEATURE, this.fastJsonConfig.getSerializerFeatures());
        stream.flush();
        if (this.updateContentLength) {
            writeToResponse(response, (ByteArrayOutputStream) stream);
        }
    }

    protected void prepareResponse(HttpServletRequest request, HttpServletResponse response) {
        setResponseContentType(request, response);
        response.setCharacterEncoding(this.fastJsonConfig.getCharset().name());
        if (this.disableCaching) {
            response.addHeader("Pragma", "no-cache");
            response.addHeader("Cache-Control", "no-cache, no-store, max-age=0");
            response.addDateHeader("Expires", 1L);
        }
    }

    public void setDisableCaching(boolean disableCaching) {
        this.disableCaching = disableCaching;
    }

    public void setUpdateContentLength(boolean updateContentLength) {
        this.updateContentLength = updateContentLength;
    }

    protected Object filterModel(Map<String, Object> model) {
        Map<String, Object> result = new HashMap<>(model.size());
        Set<String> renderedAttributes = !CollectionUtils.isEmpty(this.renderedAttributes) ? this.renderedAttributes : model.keySet();
        for (Map.Entry<String, Object> entry : model.entrySet()) {
            if (!(entry.getValue() instanceof BindingResult) && renderedAttributes.contains(entry.getKey())) {
                result.put(entry.getKey(), entry.getValue());
            }
        }
        if (this.extractValueFromSingleKeyModel && result.size() == 1) {
            Iterator<Map.Entry<String, Object>> it = result.entrySet().iterator();
            if (it.hasNext()) {
                return it.next().getValue();
            }
        }
        return result;
    }
}
