@Configuration
public class ResourceConfig implements WebMvcConfigurer {
    @Autowired
    private QrCodeProp qrCodeProp;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        String os = System.getProperty("os.name");
        if(os.toLowerCase().startsWith("win")){ //windowsϵͳ
            /** QrCodeͼƬ�洢·�� */
            registry.addResourceHandler(qrCodeProp.getHttpBasePath()
                    +"/**")
                    .addResourceLocations("file:" + qrCodeProp.getStorePath() + "/");
        }else{ //linux����mac

        }
    }

}