package com.roy.scrocket.basic;

import org.springframework.cloud.stream.annotation.StreamListener;
import org.springframework.cloud.stream.messaging.Sink;
import org.springframework.stereotype.Component;

/**
 * @author ：楼兰
 * @date ：Created in 2020/12/2
 * @description:
 **/
@Component
public class ScConsumer {

    @StreamListener(Sink.INPUT)
    public void onMessage(String messsage) {
        System.out.println("received message:" + messsage + " from binding:" +
                Sink.INPUT);
    }
}
