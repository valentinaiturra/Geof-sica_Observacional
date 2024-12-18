%Valentina Iturra Rosales 03/12/2024
clc
clear all
close all

data_NE = load("DATA_FACU_3.txt");
data_NE(:,4) = data_NE(:,4)/1000;
data_SE = load("DATA_FACU_4.txt");
data_SE(:,4) = data_SE(:,4)/1000;
data_SO = load("DATA_FACU_5.txt");
data_SO(:,4) = data_SO(:,4)/1000;
data_NO = load("DATA_FACU_6.txt");
data_NO(:,4) = data_NO(:,4)/1000;

%%

    % figure();
    %         subplot(3,1,1)
    %             plot(data_NE(:,4),data_NE(:,1),'-r');
    %             axis tight
    %             xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
    %             ylabel('Cuentas','FontWeight','normal','Color','k');
    %             title('Componente Norte-Sur')
    % 
    %         subplot(3,1,2)
    %             plot(data_NE(:,4),data_NE(:,2),'-b');
    %             axis tight
    %             xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
    %             ylabel('Cuentas','FontWeight','normal','Color','k');
    %             title('Componente Este-Oeste')
    % 
    %         subplot(3,1,3)
    %             plot(data_NE(:,4),data_NE(:,3),'-g');
    %             axis tight
    %             xlabel('Tiempo [minutos]','FontWeight','normal','Color','k');
    %             ylabel('Cuentas','FontWeight','normal','Color','k');
    %             title('Componente Z')
    %     sgtitle('Calibración geófono desde el Noreste')


        NUEVO = data_NE(1080:1140,:);

        figure();
            subplot(3,1,1)
                plot(NUEVO(:,4),NUEVO(:,1),'-r','LineWidth',2);
                axis tight
                xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
                ylabel('Cuentas','FontWeight','normal','Color','k');
                title('Componente Norte-Sur')
            subplot(3,1,2)
                plot(NUEVO(:,4),NUEVO(:,2),'-b','LineWidth',2);
                axis tight
                xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
                ylabel('Cuentas','FontWeight','normal','Color','k');
                title('Componente Este-Oeste')
            subplot(3,1,3)
                plot(NUEVO(:,4),NUEVO(:,3),'-g','LineWidth',2);
                axis tight
                xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
                ylabel('Cuentas','FontWeight','normal','Color','k');
                title('Componente Z')
        sgtitle('Señal amplificada de calibración geófono desde el Noreste')

figure()
    subplot(2,1,1)
        plot(data_NE(1090:1100,4),data_NE(1090:1100,1),'-r','LineWidth',2);
         grid minor
        xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
        ylabel('Cuentas','FontWeight','normal','Color','k');
        title('Componente Norte - Sur')
    subplot(2,1,2)
        plot(data_NE(1090:1100,4),data_NE(1090:1100,2),'-b','LineWidth',2);
        grid minor
        xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
        ylabel('Cuentas','FontWeight','normal','Color','k');
        title('Componente Este - Oeste')
    sgtitle('Señal amplificada del evento desde el Noreste')


    clear NUEVO
        %%

        % figure();
        %     subplot(3,1,1)
        %         plot(data_SE(:,4),data_SE(:,1),'-r');
        %         axis tight
        %         xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
        %         ylabel('Cuentas','FontWeight','normal','Color','k');
        %         title('Componente Norte-Sur')
        % 
        %     subplot(3,1,2)
        %         plot(data_SE(:,4),data_SE(:,2),'-b');
        %         axis tight
        %         xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
        %         ylabel('Cuentas','FontWeight','normal','Color','k');
        %         title('Componente Este-Oeste')
        % 
        %     subplot(3,1,3)
        %         plot(data_SE(:,4),data_SE(:,3),'-g');
        %         axis tight
        %         xlabel('Tiempo [minutos]','FontWeight','normal','Color','k');
        %         ylabel('Cuentas','FontWeight','normal','Color','k');
        %         title('Componente Z')
        % sgtitle('Calibración geófono desde el Sureste')



        NUEVO = data_SE(710:770,:);

        figure();
            subplot(3,1,1)
                plot(NUEVO(:,4),NUEVO(:,1),'-r','LineWidth',2);
                axis tight
                xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
                ylabel('Cuentas','FontWeight','normal','Color','k');
                title('Componente Norte-Sur')
            subplot(3,1,2)
                plot(NUEVO(:,4),NUEVO(:,2),'-b','LineWidth',2);
                axis tight
                xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
                ylabel('Cuentas','FontWeight','normal','Color','k');
                title('Componente Este-Oeste')
            subplot(3,1,3)
                plot(NUEVO(:,4),NUEVO(:,3),'-g','LineWidth',2);
                axis tight
                xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
                ylabel('Cuentas','FontWeight','normal','Color','k');
                title('Componente Z')
        sgtitle('Señal amplificada de calibración geófono desde el Sureste')

        figure()
            subplot(2,1,1)
                plot(data_SE(715:730,4),data_SE(715:730,1),'-r','LineWidth',2);
                    grid minor
                    xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
                    ylabel('Cuentas','FontWeight','normal','Color','k');
                    title('Componente Norte-Sur')
            subplot(2,1,2)
                plot(data_SE(715:730,4),data_SE(715:730,2),'-b','LineWidth',2);
                    grid minor
                    xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
                    ylabel('Cuentas','FontWeight','normal','Color','k');
                    title('Componente Este-Oeste')
            sgtitle('Señal amplificada del evento desde el Sureste')

            clear NUEVO
        %%

        % figure();
        %     subplot(3,1,1)
        %         plot(data_NO(:,4),data_NO(:,1),'-r');
        %         axis tight
        %         xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
        %         ylabel('Cuentas','FontWeight','normal','Color','k');
        %         title('Componente Norte-Sur')
        % 
        %     subplot(3,1,2)
        %         plot(data_NO(:,4),data_NO(:,2),'-b');
        %         axis tight
        %         xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
        %         ylabel('Cuentas','FontWeight','normal','Color','k');
        %         title('Componente Este-Oeste')
        % 
        %     subplot(3,1,3)
        %         plot(data_NO(:,4),data_NO(:,3),'-g');
        %         axis tight
        %         xlabel('Tiempo [minutos]','FontWeight','normal','Color','k');
        %         ylabel('Cuentas','FontWeight','normal','Color','k');
        %         title('Componente Z')
        % sgtitle('Calibración geófono desde el Noroeste')



        NUEVO = data_NO(860:920,:);

        figure();
            subplot(3,1,1)
                plot(NUEVO(:,4),NUEVO(:,1),'-r','LineWidth',2);
                axis tight
                xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
                ylabel('Cuentas','FontWeight','normal','Color','k');
                title('Componente Norte-Sur')
            subplot(3,1,2)
                plot(NUEVO(:,4),NUEVO(:,2),'-b','LineWidth',2);
                axis tight
                xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
                ylabel('Cuentas','FontWeight','normal','Color','k');
                title('Componente Este-Oeste')
            subplot(3,1,3)
                plot(NUEVO(:,4),NUEVO(:,3),'-g','LineWidth',2);
                axis tight
                xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
                ylabel('Cuentas','FontWeight','normal','Color','k');
                title('Componente Z')
        sgtitle('Señal amplificada de calibración geófono desde el Noroeste')

        
        figure()
            subplot(2,1,1)
                plot(data_NO(870:895,4),data_NO(870:895,1),'-r','LineWidth',2);
                grid minor
                xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
                ylabel('Cuentas','FontWeight','normal','Color','k');
                title('Componente Norte - Sur')
            subplot(2,1,2)
                plot(data_NO(870:895,4),data_NO(870:895,2),'-b','LineWidth',2);
                grid minor
                xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
                ylabel('Cuentas','FontWeight','normal','Color','k');
                title('Componente Este - Oeste')
            sgtitle('Señal amplificada del evento desde el Noroeste')
            

            clear NUEVO
        %%

        % figure();
        %     subplot(3,1,1)
        %         plot(data_SO(:,4),data_SO(:,1),'-r');
        %         axis tight
        %         xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
        %         ylabel('Cuentas','FontWeight','normal','Color','k');
        %         title('Componente Norte-Sur')
        % 
        %     subplot(3,1,2)
        %         plot(data_SO(:,4),data_SO(:,2),'-b');
        %         axis tight
        %         xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
        %         ylabel('Cuentas','FontWeight','normal','Color','k');
        %         title('Componente Este-Oeste')
        % 
        %     subplot(3,1,3)
        %         plot(data_SO(:,4),data_SO(:,3),'-g');
        %         axis tight
        %         xlabel('Tiempo [minutos]','FontWeight','normal','Color','k');
        %         ylabel('Cuentas','FontWeight','normal','Color','k');
        %         title('Componente Z')
        % sgtitle('Calibración geófono desde el Suroeste')


    
        NUEVO = data_SO(600:660,:);

        figure();
            subplot(3,1,1)
                plot(NUEVO(:,4),NUEVO(:,1),'-r','LineWidth',2);
                axis tight
                xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
                ylabel('Cuentas','FontWeight','normal','Color','k');
                title('Componente Norte-Sur')
            subplot(3,1,2)
                plot(NUEVO(:,4),NUEVO(:,2),'-b','LineWidth',2);
                axis tight
                xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
                ylabel('Cuentas','FontWeight','normal','Color','k');
                title('Componente Este-Oeste')
            subplot(3,1,3)
                plot(NUEVO(:,4),NUEVO(:,3),'-g','LineWidth',2);
                axis tight
                xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
                ylabel('Cuentas','FontWeight','normal','Color','k');
                title('Componente Z')
        sgtitle('Señal amplificada de calibración geófono desde el Suroeste')

        figure()
            subplot(2,1,1)
                plot(data_SO(615:631,4),data_SO(615:631,1),'-r','LineWidth',2);
                    grid minor
                    axis tight
                    title('Componente Norte - Sur')
                    xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
                    ylabel('Cuentas','FontWeight','normal','Color','k');
            subplot(2,1,2)
                plot(data_SO(615:631,4),data_SO(615:631,2),'-b','LineWidth',2);
                    grid minor
                    axis tight
                    title('Componente Este - Oeste')
                    xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
                    ylabel('Cuentas','FontWeight','normal','Color','k');
            sgtitle('Señal amplificada del evento desde el Suroeste')

            clear NUEVO
            %%

  figure()
    subplot(2,2,1)
        plot(data_NO(860:920,4),data_NO(860:920,3),'-g','LineWidth',2);
        grid minor
            xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
            ylabel('Cuentas','FontWeight','normal','Color','k');
        title('Noroeste')
        
    subplot(2,2,2)
        plot(data_NE(1080:1140,4),data_NE(1080:1140,3),'-g','LineWidth',2);
        grid minor
            xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
            ylabel('Cuentas','FontWeight','normal','Color','k');
        title('Noreste')

    subplot(2,2,3)
         plot(data_SO(600:660,4),data_SO(600:660,3),'-g','LineWidth',2);
        grid minor
            xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
            ylabel('Cuentas','FontWeight','normal','Color','k');
        title('Suroeste')
        
    subplot(2,2,4)
       plot(data_SE(710:770,4),data_SE(710:770,3),'-g','LineWidth',2);
        grid minor
            xlabel('Tiempo [segundos]','FontWeight','normal','Color','k');
            ylabel('Cuentas','FontWeight','normal','Color','k');
        axis tight
        title('Sureste')
    sgtitle('Señal amplificada de la componente Z del geófono ')
